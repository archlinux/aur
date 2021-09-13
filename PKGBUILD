# Maintainer: Caesim404 <caesim404 at gmail dot com>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

_pkgbase=svtplay-dl
pkgname="${_pkgbase}-git"
pkgver=4.4.r0.g4edb96f
pkgrel=1
pkgdesc="Media downloader for play sites (e.g. SVT Play)"
arch=('any')
url="https://github.com/spaam/svtplay-dl"
license=('MIT')
depends=('python-cryptography' 'python-requests' 'ffmpeg' 'python-yaml')
optdepends=('python-pysocks: proxy support')
makedepends=('git' 'python-setuptools' 'perl')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgbase}"
    
    python setup.py install --root="$pkgdir" --optimize=1
    
    pod2man --utf8 --center "${_pkgbase} manual" --release "${_pkgbase} ${pkgver}" "${_pkgbase}.pod" "${_pkgbase}.1"
    gzip -9 "${_pkgbase}.1"
    install -Dm644 "${_pkgbase}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgbase}.1.gz"
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
