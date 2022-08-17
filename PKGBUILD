# Maintainer: syntheit <daniel@matv.io>
pkgname=icu71-bin
pkgver=71.1
pkgrel=1
pkgdesc="International Components for Unicode library (binary release)"
arch=('x86_64')
url="https://github.com/unicode-org/icu"
license=('custom:icu')
provides=('icu71')
depends=('bash')
source=("https://github.com/unicode-org/icu/releases/download/release-71-1/icu4c-71_1-Fedora32-x64.tgz")
sha512sums=('ed3cf1aa7fcbf6e7f10d1a873876d8b493f338bf839086da0bf1ef1df9dae2f635b8e80ba70159a1d243a423aef99108bc2a03046fd63f28599429d9dcdae38e')

package() {
    tar xf icu4c-71_1-Fedora32-x64.tgz
    # Remove certain files if icu is installed to not cause conflicts
    rm -rf "${srcdir}"/icu/usr/local/lib/icu  "${srcdir}"/icu/usr/local/lib/pkgconfig
    for filename in "${srcdir}"/icu/usr/local/lib/*.so; do
		if [[ ! -e "$filename" ]]; then continue; fi
        if [[ -e "/usr/lib/${filename##*/}" ]]; then
            rm -rf "${filename}"
        fi
    done
    mkdir -p "${pkgdir}"/usr/{share,lib}
    mkdir -p "${pkgdir}"/usr/share/licenses/icu69
    cp -rn "${srcdir}"/icu/usr/local/lib/* -t "${pkgdir}"/usr/lib/
    install -Dm644 "${srcdir}"/icu/usr/local/share/icu/69.1/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
