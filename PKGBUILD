# Maintainer: Virgile Robles <virgile.robles at pm dot me>
# Inspired from the PKGBUILD for 0cc-famitracker by Difarem
pkgname=dn-famitracker-bin
pkgver=0.5.0.2
pkgrel=1
pkgdesc='Fork of 0cc-FamiTracker (a NES tracker) that incorporates numerous fixes and features.'
arch=('x86_64')
url="https://github.com/Dn-Programming-Core-Management/Dn-FamiTracker"
license=(GPL-2.0-or-later)
depends=(wine bash)
makedepends=(p7zip)
_filename=Dn-FamiTracker_v0502_x64_Release
source=($url/releases/download/Dn$pkgver/$_filename.7z
        Dn-FamiTracker
        Dn-FamiTracker.desktop
        Dn-FamiTracker.png)
noextract=($_filename.7z)
md5sums=('fdda235ad61b312a38a687320aa6dcf7'
         '4fbafd091e31f5cbc28e3a01e5366415'
         '34e9e42b24132376511e0768bf9cf77c'
         '2e155ab213a93fe4b9ad0d75f8e53b91')

prepare() {
  7z x $_filename.7z -o$srcdir/$_filename
}

package() {
  cd $srcdir
  install -Dm755 Dn-FamiTracker $pkgdir/usr/bin/Dn-FamiTracker
  install -Dm644 Dn-FamiTracker.desktop $pkgdir/usr/share/applications/Dn-FamiTracker.desktop
  install -Dm644 Dn-FamiTracker.png $pkgdir/usr/share/pixmaps/Dn-FamiTracker.png
  
  install -Dm644 $_filename/CHANGELOG.md $pkgdir/usr/share/doc/Dn-FamiTracker/CHANGELOG.md
  
  cp -rT $_filename/ $pkgdir/usr/share/Dn-FamiTracker
  find $pkgdir/usr/share/Dn-FamiTracker -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/Dn-FamiTracker -type f -exec chmod 644 "{}" \;
}
