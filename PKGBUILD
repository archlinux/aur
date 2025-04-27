# Maintainer: Islam Nofl <islamnofl.official@gmail.com>

_depver="16.1-1+13.2"

pkgname=mingw-w64-gdb-target
pkgver=16.1.1
pkgrel=1
pkgdesc="Cross-debugger server for Win32 and Win64 using MinGW-w64 extracted from Debian package"
arch=("i686" "x86_64")
url="https://packages.debian.org/sid/all/gdb-mingw-w64-target"
license=("GPL-3+")
source=("http://ftp.debian.org/debian/pool/main/g/gdb-mingw-w64/gdb-mingw-w64-target_${_depver}_all.deb")
sha256sums=("83e57f98a78ecd42cf9d418132d42482bcdfbcc571b95c0ff04c1df8716af0bc")
options=("!docs")
conflicts=("mingw-w64-gdb-target")

prepare() {
    # Ensure the required tools are available
    command -v ar >/dev/null 2>&1 || { echo "Error: 'ar' is required but not found."; exit 1; }
    command -v tar >/dev/null 2>&1 || { echo "Error: 'tar' is required but not found."; exit 1; }

    # Extract the .deb file (which is an ar archive)
    mkdir -p "${srcdir}/deb_contents"
    cd "${srcdir}/deb_contents"
    ar x "../gdb-mingw-w64-target_${_depver}_all.deb"
}

package() {
    cd "${srcdir}/deb_contents"

    # Check if data.tar.xz exists
    if [[ ! -f "data.tar.xz" ]]; then
        echo "Error: 'data.tar.xz' not found in the Debian package."
        exit 1
    fi

    # Extract data.tar.xz into the root directory
    tar -xJf "data.tar.xz" -C "${pkgdir}"

    # Ensure all files are correctly placed
    echo "Files extracted successfully."
}
