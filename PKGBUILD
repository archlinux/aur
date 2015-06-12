#Maintainer Ryan Owens <RyanOwens[at]linux[dot]com>
#Original Creators Philip Müller <philm[at]manjaro[dot]org> and Rob McCathie <rob[at]manjaro[dot]org>

pkgname=ozunity-welcome
pkgver=0.1
pkgrel=1
pkgdesc="The Oz Unity fork of the Manjaro Welcome utility provides a simple interface for accessing all the relevant information for a new user of Oz Unity Manjaro Editon."
arch=(any)
url="https://github.com/ryanvade/$pkgname"
license=('GPL')
depends=('python-gobject' 'pywebkitgtk' 'ozunity-wallpapers')
makedepends=('git')
conflicts=('manjaro-welcome')
provides=('manjaro-welcome')
options=(!emptydirs)
source=(git+https://github.com/ryanvade/$pkgname.git)
sha256sums=('SKIP')


package() {
    if [ -e "$srcdir/$pkgname.git" ]; then
        cd "$srcdir/$pkgname.git/src"
    else
        cd "$srcdir/$pkgname/src"
    fi
    
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    cp  -a data/* "${pkgdir}/usr/share/${pkgname}"
    touch "${pkgdir}/usr/share/${pkgname}/index.html"
    chmod 666 "${pkgdir}/usr/share/${pkgname}/index.html"
    install -D -m644 ${pkgname}.desktop ${pkgdir}/etc/skel/.config/autostart/${pkgname}.desktop
    install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m755 "${pkgname}-terminal" "${pkgdir}/usr/bin/${pkgname}-terminal"

}
