# Maintainer: Alfonso² Peterssen <a2peterssen+aur ÅT gmail DÖT com>
pkgname=('jbang')
pkgver=0.141.0
pkgrel=2
pkgdesc="Unleash the (scripting) power of Java"
url="https://www.jbang.dev"
license=('MIT')
depends=('bash'
         'java-environment>=8')
optdepends=('java-environment>=9: jshell support')

if [[ $CARCH == x86_64 ]]; then
  arch=('x86_64')
  _archive="jbang-${pkgver}-linux-x64.zip"
  _archive_file="jbang-${pkgver}-linux-x64.zip"
  _archive_sha256='2d0227a8867918c6e8aac0aefe04090781f8ed730904bf091b89eac4f5473ef4'
  _source_dir="jbang-${pkgver}"
else
  arch=('any')
  _archive='jbang.zip'
  _archive_file="jbang-${pkgver}.zip"
  _archive_sha256='9f7dcc78b19e4d8ab0cf6950b1e1e78f4a063891613a5541e8d587fe5a6206eb'
  _source_dir='jbang'
fi

source=("${_archive_file}::https://github.com/jbangdev/jbang/releases/download/v${pkgver}/${_archive}"
        "https://raw.githubusercontent.com/jbangdev/jbang/v${pkgver}/LICENSE")
sha256sums=("${_archive_sha256}"
            '7c1797962764ae89b1774c44b7ad449e6eaaa83a8e4e4804d965978fe7231d9c')

package() {
  cd "${_source_dir}"
  install -d "${pkgdir}/usr/share/jbang"

  cp -r bin "${pkgdir}/usr/share/jbang/"

  rm "${pkgdir}"/usr/share/jbang/bin/*.cmd "${pkgdir}"/usr/share/jbang/bin/*.ps1

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/jbang/bin/jbang" "${pkgdir}/usr/bin/jbang"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
