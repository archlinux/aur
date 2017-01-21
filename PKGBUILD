# Maintainer: Constantin Lorenz <Cons27773964@aol.com>

pkgname=sandboxed-tor-browser # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.0.3.r1.g6477aea
pkgrel=1
pkgdesc="A sandboxed version of the Tor Browser, currently in alpha!"
arch=('x86_64')
url="https://trac.torproject.org/projects/tor/wiki/doc/TorBrowser/Sandbox/Linux"
license=('AGPL3')
groups=()
depends=(bubblewrap gtk3 gnome-themes-standard)
optdepends=(libnotify)
makedepends=(make git gcc gb go libnotify)
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('git+https://git.torproject.org/tor-browser/sandboxed-tor-browser.git')
source+=("${pkgname}.desktop"
         "${pkgname}.png")
noextract=()
md5sums=('SKIP'
         '49042133dbfad9f06df48c934dc123e6'
         '494afbfa60fb4ce21840244cc3f7208c')


pkgver() {
	cd "$srcdir/${pkgname%-VCS}"


# Git, tags available
	printf "$(git describe --long | sed 's/^sandboxed-tor-browser-//;s/\([^-]*-g\)/r\1/;s/-/./g')"

}


package() {
	cd "$srcdir/${pkgname%}"
	make DESTDIR="$pkgdir/"	
	cd "$srcdir"
	install -Dm 644 ${pkgname}.desktop      ${pkgdir}/usr/share/applications/${pkgname}.desktop
   	install -Dm 644 ${pkgname}.png          ${pkgdir}/usr/share/pixmaps/${pkgname}.png
   	install -Dm 755 ${srcdir}/sandboxed-tor-browser/bin/sandboxed-tor-browser           ${pkgdir}/usr/bin/${pkgname}
}

