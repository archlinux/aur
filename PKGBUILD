# Submiter: ZekeSulastin <zekesulastin@gmail.com>
# Maintainer: AdrianoML <adriano.lols@gmail.com>

pkgname=jstest-gtk-git
pkgver=0.1.0.r69.ge89ae8f
pkgrel=1
pkgdesc="A simple GTK2-based joystick tester and calibrator"
arch=('i686' 'x86_64')
url="https://github.com/Grumbel/jstest-gtk/"
source=('git://github.com/Grumbel/jstest-gtk/' 'jstest-gtk.desktop' 'fix_asset_path.patch')
license=('GPL3')
depends=('gtkmm')
makedepends=('git' 'cmake')
_gitname="jstest-gtk"

sha1sums=('SKIP'
          '4a8a3f5ac41b509fdfc0aec7cf017447e58ec973'
          '69df12f70712e68f5d2f75d24a5d2bff0a1e0a5e')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  msg "Patching..."
  patch -p0 < "$srcdir/fix_asset_path.patch"

  if [[ ! -e 'build' ]]; then
      mkdir build
  fi
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$_gitname"

  install -D -m755 build/jstest-gtk "$pkgdir/usr/bin/jstest-gtk"
  install -D -m644 "./data/generic.png" "${pkgdir}/usr/share/icons/jstest-gtk.png"
  install -D -m644 "${srcdir}/jstest-gtk.desktop" "${pkgdir}/usr/share/applications/jstest-gtk.desktop"
  mkdir -p "${pkgdir}/usr/share/jstest-gtk"
  cp -r "${srcdir}/jstest-gtk/data" "${pkgdir}/usr/share/jstest-gtk/"
}

sha1sums=('SKIP'
          '4a8a3f5ac41b509fdfc0aec7cf017447e58ec973'
          'a278a643b2b9e12b6ca152cfb954e0b8f46e1388')
sha1sums=('SKIP'
          '4a8a3f5ac41b509fdfc0aec7cf017447e58ec973'
          'c05ac388689f47338635fbf55a1620a8e9e0eacc')
sha1sums=('SKIP'
          '4a8a3f5ac41b509fdfc0aec7cf017447e58ec973'
          '5db189b830755a5cf5424210ac08c0aaf9709a8b')
