# Maintainer: Islam Nofl <islamnofl.official@gmail.com>

_debver="16.1-1+13.2"

pkgname=mingw-w64-gdb-target
pkgver=17.1.3+13.3
pkgrel=1
pkgdesc="Cross-debugger server for Win32 and Win64 using MinGW-w64 extracted from Debian package"
arch=(i686 x86_64)
url="https://packages.debian.org/sid/all/gdb-mingw-w64-target"
license=(GPL-3+)

depends=()
makedepends=()
options=(!docs)

source=("http://ftp.debian.org/debian/pool/main/g/gdb-mingw-w64/gdb-mingw-w64_17.1-3+13.3_amd64.deb")
sha256sums=('72b3b0c37a51b762435d046a4257bde5b4b66f9ac92bf778342e010b18366b59')

prepare() {
    command -v ar >/dev/null 2>&1 || { echo "Error: 'ar' is required but not found."; exit 1; }
    command -v tar >/dev/null 2>&1 || { echo "Error: 'tar' is required but not found."; exit 1; }

    mkdir -p "${srcdir}/deb_contents"
    cd "${srcdir}/deb_contents"
    ar x "../$(basename 'http://ftp.debian.org/debian/pool/main/g/gdb-mingw-w64/gdb-mingw-w64_17.1-3+13.3_amd64.deb')"
}

package() {
    cd "${srcdir}/deb_contents"

    if [[ ! -f data.tar.* ]]; then
        echo "Error: data.tar.* not found in the Debian package."
        exit 1
    fi

    tar -xf data.tar.* -C "${pkgdir}"

    echo "Files extracted successfully."
}