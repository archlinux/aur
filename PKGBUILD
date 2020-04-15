# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh
pkgver=0.9.0
pkgrel=1
_file="$pkgname-$pkgver-py3-none-any.whl"
pkgdesc="Graphical interface for managing your applications ( AppImage, Flatpak, Snap, Arch/AUR, Web )"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pyqt5' 'python-requests' 'python-colorama' 'python-pyaml')
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
            'git: to allow AUR packages downgrading'            
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
            'aria2: faster AppImages and AUR source downloads'
            'breeze: for KDE Plasma main theme be available')
makedepends=('git' 'python' 'python-pip' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/c7/e3/a340e2109b6755356a6e8eeb5bc73e85f844af0ad6cf107a37674ed30f14/$_file")
sha256sums=('2f63373c3a48da86a1fff40a02e7c662721d057a9a015f2f433ecb1fddf37b30')

package() {
  pip3 install $_file --root="$pkgdir" || return 1
  
  pydir=$(ls $pkgdir/usr/lib)
  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps

  cp $pkgdir/usr/lib/$pydir/site-packages/bauh/view/resources/img/logo.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/bauh.svg
 
  mkdir -p $pkgdir/usr/share/applications
  cp $pkgdir/usr/lib/$pydir/site-packages/bauh/desktop/bauh.desktop $pkgdir/usr/share/applications/
  cp $pkgdir/usr/lib/$pydir/site-packages/bauh/desktop/bauh_tray.desktop $pkgdir/usr/share/applications/
}
