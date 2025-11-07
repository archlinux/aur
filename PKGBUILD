# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=keircn
_pkgname=archium
pkgname=${_pkgname}-bin
pkgver=1.10.1
pkgrel=1
pkgdesc="Archium is a wrapper for AUR helpers such as YAY and Paru"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'readline')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}::${_urlraw}/README.md"
  "COMPLETIONS-${pkgver}.bash::${_urlraw}/completions/archium.bash"
  "COMPLETIONS-${pkgver}.zsh::${_urlraw}/completions/archium.zsh"
  "COMPLETIONS-${pkgver}.fish::${_urlraw}/completions/archium.fish")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('66a37b615c2d3d566fb792cf78eed43cbc6806a5a7241e7d4b43e475b610443e'
            '0b5c9c1049f56bfbe28e715a32d76eba9479af5791c815dad9dd9a6b9ac74f84'
            '21edff2be0071525382ffccd5eed157c1455fb07e68072d2e2613c29970bb799'
            '5913a44fa56edca7c78929e771cc044867b04f313f377b3ad0de8a58192a4163'
            'd870f066805d2740aa8053908d405774e9fb55e85be433d2219e9c68f87050b8')
sha256sums_x86_64=('2d43f3859dac430261520cc1082d97b6f0ee60467c4acb557a9dd726426bbf2e')

prepare() {
  cd "${srcdir}/" || exit

  mv "release/${_pkgname}" ./
  rm -rf "release"

  mkdir -p "completions"
  for completion in COMPLETIONS*; do
    mv ${completion} "./completions"
  done
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "completions/COMPLETIONS-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/archium"
  install -Dm644 "completions/COMPLETIONS-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_archium"
  install -Dm644 "completions/COMPLETIONS-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/archium.fish"

  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
