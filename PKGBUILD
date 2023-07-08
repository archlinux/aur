# Maintainer: Fernando Barillas < aur at fbis251 dot com >

pkgname=retry
pkgver=1.0.5
pkgrel=1
pkgdesc="Repeat a command until the command succeeds."
arch=("any")
url="https://github.com/minfrin/retry"
license=("Apache")
_pkg_version="${pkgname}-${pkgver}"
source=("https://github.com/minfrin/retry/releases/download/${_pkg_version}/${_pkg_version}.tar.gz")
# Verify the checksum against the release page: https://github.com/minfrin/retry/releases
sha256sums=('09a75450153e65aca1cd5fa366d54a314050f8f19e8ba5747656c5b673b65fdf')

package() {
  cd "${srcdir}/${_pkg_version}"

  autoreconf -fi
  ./configure
  make check
  make install DESTDIR="${pkgdir}"

  "${pkgdir}/usr/local/bin/retry" --version

  mkdir -p "${pkgdir}/usr/share/man/man1/"
  mv "${pkgdir}/usr/local/share/man/man1/retry.1" "${pkgdir}/usr/share/man/man1/"
  rm -r "${pkgdir}/usr/local/share"
}
