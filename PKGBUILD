# Maintainer: zoidby

pkgname=quake3e-git
pkgver=r2146.3fb70d37
pkgrel=1
provides=('quake3')
pkgdesc="Improved Quake III Arena Engine"
url="https://github.com/ec-/Quake3e"
license=('GPL')
arch=('x86_64')
makedepends=('git' 'libxxf86dga')
source=('git+https://github.com/ec-/Quake3e.git'
'quake3e.desktop'
'quake3e.png')
sha256sums=('SKIP'
'18d569ec6896338ffde7d00996f2e63d8df88d16d9a9ccb8bd9a14c76b4a8aa2'
'9bb20ad9e3f569dcc0d0b522c03bfb2021096b08f073b79704b86feaa67e82f8')
install=$pkgname.install

pkgver() {
    cd $srcdir/Quake3e
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    }

build() {
    cd $srcdir/Quake3e
    make
    }

package() {
    install -D -m 755 $srcdir/Quake3e/build/release-linux-x86_64/quake3e.x64 $pkgdir/opt/quake3/quake3e.x64
    install -D -m 755 $srcdir/Quake3e/build/release-linux-x86_64/quake3e.ded.x64 $pkgdir/opt/quake3/quake3e.ded.x64
    install -D -m 644 $srcdir/Quake3e/build/release-linux-x86_64/quake3e_opengl_x86_64.so $pkgdir/opt/quake3/quake3e_opengl_x86_64.so
    install -D -m 644 $srcdir/Quake3e/build/release-linux-x86_64/quake3e_vulkan_x86_64.so $pkgdir/opt/quake3/quake3e_vulkan_x86_64.so
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/quake3/quake3e.x64 $pkgdir/usr/bin/quake3e
    ln -s /opt/quake3/quake3e.ded.x64 $pkgdir/usr/bin/quake3e.ded
    install -D -m 644 quake3e.desktop $pkgdir/usr/share/applications/quake3e.desktop
    install -D -m 644 quake3e.png $pkgdir/usr/share/pixmaps/quake3e.png
    }
