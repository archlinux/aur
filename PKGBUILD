# Maintainer: Pablo Loezaeta <prflr88 (aro'a) gmail puntocom>

pkgbase=bluecurve-theme-git
pkgname=('bluecurve-gtk-theme-git'
	'gtk-engine-bluecurve-git'
	'bluecurve-icon-theme-git'
	'bluecurve-wallpapers-git')
pkgver=3.0.0.r238
pkgrel=1
pkgdesc="RedHat and Fedora Core Bluecurve icon and gtk theme ported to GTK 3/4. Designed for the MATE and Xfce desktop environments."
url="https://github.com/neeeeow/Bluecurve.git"
licence=('GPL-3.0')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('ttf-luxi: Fonstset recomended from the developers..')
options=('!strip')
source=('Bluecurve::git+https://github.com/neeeeow/Bluecurve.git')
md5sums=('SKIP')
makedepends=('git' 'cmake')

pkgver() {
  cd "Bluecurve"
	echo $(git describe --always --abbrev=0 --tags).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

build() {
  cd "${srcdir}/Bluecurve"
  cd "engine/src"
  mkdir "build"
  cd "build"
  cmake -DINSTALL_SYSTEM_WIDE=ON ..
}

package_bluecurve-gtk-theme-git() {
  pkgdesc="RedHat/Fedora Bluecurve theme ported over to GTK 3/4."
  provides=('bluecurve-gtk-theme')
  conflict=('bluecurve-gtk-theme')
  depends=('gtk2')
  arch=('any')
  mkdir -p --verbose "${pkgdir}/usr/share/themes/"
  cp --verbose -r "${srcdir}"/Bluecurve/themes/* "${pkgdir}/usr/share/themes/"
}


package_gtk-engine-bluecurve-git() {
  pkgdesc="Bluecurve GTK2 engine."
  provides=('bluecurve-gtk-engine' 'gtk-engine-bluecurve' 'gtk-bluecurve-engine')
  conflict=('bluecurve-gtk-engine' 'gtk-engine-bluecurve' 'gtk-bluecurve-engine')
  arch=('i686' 'x86_64' 'armv7h' 'aarch64')

  cd "${srcdir}/Bluecurve/engine/src/build"
  make
  make DESTDIR="${pkgdir}" install

}

package_bluecurve-icon-theme-git() {
  pkgdesc="RedHat/Fedora Bluecurve iconset made it work for other desktops."
  provides=('bluecurve-icon-theme' 'xcursor-bluecurve')
  conflicts=('bluecurve-icon-theme' 'xcursor-bluecurve')
  arch=('any')

  mkdir -p --verbose "${pkgdir}/usr/share/icons"
  cp --verbose -r "${srcdir}"/Bluecurve/icons/* "${pkgdir}/usr/share/icons/"
}

package_bluecurve-wallpapers-git() {
  pkgdesc="RedHat 4 and Fedora Core 1,2,3 classic wallpapers."
  provides=('rhel4-wallpapers' 'f1-backgrounds' 'f2-backgrounds' 'f3-backgrounds')
  conflicts=('rhel4-wallpapers' 'f1-backgrounds' 'f2-backgrounds' 'f3-backgrounds')
  arch=('any')

  mkdir -p --verbose "${pkgdir}/usr/share/backgrounds/wallpapers"
  mkdir -p --verbose "${pkgdir}/usr/share/backgrounds/xfce"
  cp --verbose -r "${srcdir}"/Bluecurve/wallpapers/* "${pkgdir}/usr/share/backgrounds/wallpapers/"
  cp --verbose -r "${srcdir}"/Bluecurve/wallpapers/* "${pkgdir}/usr/share/backgrounds/xfce/"
}
