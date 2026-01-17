_pkgnameorigin=cnijlfpfilter
pkgname="${_pkgnameorigin}-bin"
pkgver=10.22
pkgrel=1
pkgdesc="IJ Printer Driver Ver.${pkgver} (binary)"
arch=('x86_64' 'aarch64' 'mips64el')
url="https://www.usa.canon.com/content/canon/en/search.html?q=cnijlfpfilter-10.22-1-deb.tar.gz&r=support"
_baseurl="https://pdisp01.c-wss.com/gdl"
_file_id="MDEwMDAxMjUzODAy"

depends=(
    cups
)

source=("${_baseurl}/WWUFORedirectTarget.do?id=${_file_id}")
sha256sums=('f1524dc6007f2f9633f5ab0f2d9ebe50a3571847501dd9205f164773e3b0497e')

_archname() {
    local _archname=""
    arch="$(uname -m)"
    if [ "$arch" = "x86_64" ]; then
        _archname="amd64"
    elif [ "$arch" = "aarch64" ]; then
        _archname="arm64"
    elif [ "$arch" = "mips64" ]; then
        _archname="mips64el"
    else
        echo "No binaries for architecture $arch found" >&2
        exit 1
    fi
    echo "${_archname}"
}

package() {
    cd "${srcdir}/${_pkgnameorigin}-${pkgver}-1-deb/packages"
    filename="${_pkgnameorigin}_${pkgver}-1_$(_archname).deb"
    ar x "$filename"
    if [[ -f data.tar.xz ]]; then
        tar -xvf data.tar.xz -C "$pkgdir"
    elif [[ -f data.tar.gz ]]; then
        tar -xvf data.tar.gz -C "$pkgdir"
    fi
}
