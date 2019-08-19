# Maintainer: Giusy Margarita <kurmikon at libero dot it>

_relver=1.2

pkgname=acestream-proxy-git
pkgver=$_relver
pkgrel=1
pkgdesc="AceStream Proxy new version capable of providing multiple streams of the same channel over HTTP (git version)"
arch=("any")
url="https://github.com/pepsik-kiev/HTTPAceProxy.git"
license=("custom")
depends=("acestream-engine" 
         "python>3.4"
         "python-gevent>=1.3.3" 
         "python-psutil>=5.3.0")
optdepends=('ffmpeg: for stream transcoding')
provides=("aceproxy")
conflicts=("aceproxy")
backup=("usr/lib/aceproxy/aceconfig.py")
source=("$pkgname::git+$url")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    
    # Git, no tags available
    printf "$_relver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/bin"
  
  rm -rf "$srcdir/$pkgname/.git"
  cp -r "$srcdir/$pkgname" "$pkgdir/usr/lib/aceproxy"

  ln -s "/usr/lib/aceproxy/acehttp.py" "$pkgdir/usr/bin/aceproxy"
  ln -s "/usr/lib/aceproxy/acehttp.py" "$pkgdir/usr/bin/acestreamproxy"
} 
