# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh
pkgver=0.9.25
pkgrel=1
pkgdesc="Graphical interface for managing your applications (AppImage, Flatpak, Snap, Arch/AUR, Web)"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pyqt5' 'python-pyqt5-sip' 'python-requests' 'python-colorama' 'python-pyaml' 'qt5-svg' 'python-dateutil' 'python-packaging')
optdepends=('flatpak: required for Flatpak support' 
            'snapd: required for Snap support'
            'python-beautifulsoup4: for Native Web applications support'
            'python-lxml: for Native Web applications support'
            'sqlite3: required for AppImage support'
            'wget: required for AppImage and AUR support'
            'fuse2: may be required for AppImage support'
            'fuse3: may be required for AppImage support'
            'pacman: required for AUR support'             
            'binutils: required for AUR support'
            'git: required for AUR support'
            'rebuild-detector: enables rebuild checking for AUR packages (optional)'            
            'autoconf: may be required to compile some AUR packages'
            'automake: may be required to compile some AUR packages'
            'bison: may be required to compile some AUR packages'
            'fakeroot: may be required to compile some AUR packages'
            'flex: may be required to compile some AUR packages'
            'gcc: may be required to compile some AUR packages'
            'm4: may be required to compile some AUR packages'
            'lib32-fakeroot: may be required to compile some AUR packages'
            'make: may be required to compile some AUR packages'
            'patch: may be required to compile some AUR packages'
            'pkgconf: may be required to compile some AUR packages'            
            'ccache: can improve AUR packages compilation speed' 
            'aria2: multi-threaded downloading support'
            'breeze: KDE Plasma main theme'
            'axel: multi-threaded downloading support'
            'shadow: to install AUR packages as the root user'
            'util-linux: to install AUR packages as the root user')
makedepends=('git' 'python' 'python-pip' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('4095249677d46e2d2330aa89f91a6cc2a9356b84330372858e4fd364c38d7e6d8d97d10073c93e97664fac6141a7ea3f07e3d9cfb52aa0e09cfcf52a5f6f3f23')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  
  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps

  cp bauh/view/resources/img/logo.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/bauh.svg
 
  mkdir -p $pkgdir/usr/share/applications
  mv bauh/desktop/bauh.desktop $pkgdir/usr/share/applications/
  mv bauh/desktop/bauh_tray.desktop $pkgdir/usr/share/applications/
}
