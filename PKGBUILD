# Contributor: Jari Vetoniemi <mailroxas _at_ gmail >
# Maintainer : David Phillips <dbphillipsnz gmail>


_pkgname=dmenu
_patch=pango
pkgname=${_pkgname}-${_patch}
pkgver=4.5
pkgrel=3
pkgdesc="Dynamic X menu - with pango support"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft' 'pango')
conflicts=(${_pkgname} 'dmenu-xft')
provides=(${_pkgname})
source=("http://dl.suckless.org/tools/${_pkgname}-${pkgver}.tar.gz"
        ${_pkgname}-${pkgver}-${_patch}.patch)
sha512sums=('872dee68c35a93c663eb0a941653eaaa4aa83d8379e05b4dbca089a2c9335036b496de85d8ddf7af1228a5625490a06a89031fb1aac726236b608b952962c248'
            '5c75ff3ed20af012de7f569913a742b2240409668fd7879bd33920593c5dae95702d9bc4fa43874b6429e9d5eb6e398c7ad66775734aec6e29b9d21f432412b0')

build () {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/${_pkgname}-${pkgver}-${_patch}.patch"
	make
}

package () {
    cd "$srcdir/${_pkgname}-$pkgver"
    make DESTDIR=${pkgdir} PREFIX=/usr install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

