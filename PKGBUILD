# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gemname=salticid

pkgname=salticid
pkgver=1.0.1
pkgrel=2
pkgdesc='Run commands over SSH, with Ruby magic.'
url='https://github.com/aphyr/salticid'
arch=('any')
license=('MIT')
depends=(
  'ruby>=1.8.7'
  'ruby-trollop>=1.16.2'
  'ruby-net-scp'
  'ruby-net-ssh'
  'ruby-curses'
  'ruby-net-ssh-gateway'
  'ruby-net-ssh-multi'
)
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('64a421d6626624af22ed9ea26e54ac87be649eb657662444eaabd47e5fcee77b')

package() {
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" \
    ${_gemname}-${pkgver}.gem

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  # Change `trollop ~> 1.16.2` to `trollop >= 1.16.2`
  sed -i 's/~> 1.16.2/>= 1.16.2/g' \
    "${pkgdir}/${_gemdir}/specifications/${_gemname}-${pkgver}.gemspec"

  install -D -m644 \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/README.markdown" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.markdown"
  install -D -m644 \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
