# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: olantwin <olantwin@gmail.com>

pkgname=vim-airline
pkgver=0.12
pkgrel=1
pkgdesc='Status line, written in Vimscript'
url='https://github.com/vim-airline/vim-airline'
arch=('any')
license=('MIT')
depends=('vim-plugin-runtime')
groups=('vim-plugins')
optdepends=('powerline-fonts: patched fonts for airline symbols'
            'vim-airline-themes: additional themes')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8a1987c53523ac4c51e5c4fc7b587572bb97ac10896dc87cb55636b9630c08f4')

latestver() {
  gh api --paginate repos/vim-airline/vim-airline/releases --jq \
    '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
    sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
  cd ${pkgname}-${pkgver}

  _installpath="$pkgdir/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp -r -t "${_installpath}" autoload doc plugin
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
