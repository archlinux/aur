pkgname=mingw-w64-gdb-target
pkgver=17.2.1+13.4+b1
pkgrel=2
pkgdesc="Cross-debugger server for Win32 and Win64 using MinGW-w64 extracted from Debian package"
arch=(i686 x86_64)
url="https://packages.debian.org/sid/all/gdb-mingw-w64-target"
license=(GPL-3+)

depends=()
options=(!docs)

source=("http://ftp.debian.org/debian/pool/main/g/gdb-mingw-w64/gdb-mingw-w64_17.2-1+13.4+b1_amd64.deb")
sha256sums=('1ac5f1eb72852a6d1fc69622141aa351ef07e6a18a8339119bf250d0ebb18a5c')

_debfile="$(basename 'http://ftp.debian.org/debian/pool/main/g/gdb-mingw-w64/gdb-mingw-w64_17.2-1+13.4+b1_amd64.deb')"

prepare() {
    mkdir -p "${srcdir}/deb_contents"
    cd "${srcdir}/deb_contents"
    command -v ar >/dev/null 2>&1 || { echo "Error: 'ar' is required but not found."; exit 1; }
    ar x "../${_debfile}"
}

package() {
    cd "${srcdir}/deb_contents"
    if ! compgen -G "data.tar.*" > /dev/null; then
        echo "Error: data.tar.* not found in the Debian package."
        exit 1
    fi
    tar -xf data.tar.* -C "${pkgdir}"
    # Install additional files from deb_contents (e.g., LICENSE from .deb)
}