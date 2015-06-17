#Mantainer: M0Rf30
pkgname=wolfsp-git
pkgver=69.046504e
pkgrel=1
pkgdesc="Return to Castle Wolfenstein Single Player (Justin Crawford fork)"
arch=('i686' 'x86_64')
url="https://github.com/Justasic/RTCW-SP"
license=('GPL3')
depends=('sdl_sound' 'libxxf86vm' 'mesa' 'wolf-data')
makedepends=('git' 'make' 'libxxf86dga' 'cmake')
source=('wolfsp::git://github.com/Justasic/RTCW-SP.git'
	'wolfsp.launcher' 'wolfsp.png' 'wolfsp.desktop')
install='wolfsp-git.install'

build() {
  cd wolfsp
  if [ ! -f /opt/wolf-data/pak0.pk3 ]; then
    echo "pak0.pk3 doesn't exist. This process will be terminated"
    echo "Follow the wolf-data package instructions!"
  exit 1
  fi
  mkdir release && cd release
  cmake ../. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/wolfsp
  make
}

package(){
  cd wolfsp
  cd release
  make DESTDIR=$pkgdir install
    
  ln -s -r /opt/wolf-data/mp_bin.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/mp_pak1.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/mp_pak2.pk3	$pkgdir/opt/wolfsp/main  
  ln -s -r /opt/wolf-data/mp_pak3.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/mp_pak4.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/mp_pak5.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps0.pk3	$pkgdir/opt/wolfsp/main  
  ln -s -r /opt/wolf-data/mp_pakmaps1.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps2.pk3	$pkgdir/opt/wolfsp/main  
  ln -s -r /opt/wolf-data/mp_pakmaps3.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps4.pk3	$pkgdir/opt/wolfsp/main  
  ln -s -r /opt/wolf-data/mp_pakmaps5.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/mp_pakmaps6.pk3	$pkgdir/opt/wolfsp/main  
  ln -s -r /opt/wolf-data/scripts	$pkgdir/opt/wolfsp/main 
  ln -s -r /opt/wolf-data/pak0.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/sp_pak1.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/sp_pak2.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/sp_pak3.pk3	$pkgdir/opt/wolfsp/main
  ln -s -r /opt/wolf-data/rotate.cfg	$pkgdir/opt/wolfsp/main       
  
  # Install Launcher Script (Single Player Client)
    install -D -m 755 $srcdir/wolfsp.launcher \
        $pkgdir/usr/bin/wolfsp
  
  # Install Desktop File (Single Player)
    install -D -m 644 $srcdir/wolfsp.desktop \
        $pkgdir/usr/share/applications/wolfsp.desktop

  # Install Icon File (Single Player)
    install -D -m 644 ../icon.jpg \
        $pkgdir/usr/share/pixmaps/wolfsp.jpg

  rm -rf "$srcdir/$_gitname-build"
} 

pkgver() {
  cd wolfsp
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
md5sums=('SKIP'
         '81ff046200847bcb29189eb91f753533'
         'bf26dc4c10d4bbfbd0c7a052a00c3cdf'
         '82c8aa5312d55e9a89a51c759d964841')
