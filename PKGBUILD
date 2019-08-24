# Maintainer: PommeDroid <pommedroid@dreamnet.tech>

pkgname=dreampower-cpu
pkgver=1.1.0
pkgrel=1
pkgdesc='CLI application that allow to transform photos of people for private entertainment - No CUDA support'
arch=('x86_64')
options=(!strip)
url='https://github.com/private-dreamnet/dreampower'
license=('GPL3')
depends=('dreampower-checkpoints' 'libxrender')
makedepends=('git' 'python' 'python-virtualenv' 'python-pip' 'tk' 'libsm')
provides=('dreampower')
conflicts=('dreampower')
source=(
  "$pkgname-$pkgver::git+${url}.git#tag=v$pkgver"
  'dreampower'
)
md5sums=(
  'SKIP'
  '3d4dd155d414eb1c8484731eb339e596'
)

prepare() {
  cd "$pkgname-$pkgver"
  virtualenv venv
  source venv/bin/activate
  
  cd "scripts" 
  python setup.py --cpu
}

build() {
	source "$pkgname-$pkgver/venv/bin/activate"
	cd "$pkgname-$pkgver/scripts" 
	python build.py
}


package() {
  local name="dreampower"
  install -dm755 "$pkgdir/opt"
  cp -R "$pkgname-$pkgver/dist/$name" "$pkgdir/opt/"
  chmod -R 755 "$pkgdir/opt/$name/" 
 
  install -Dm755 dreampower "$pkgdir/usr/bin/$name"
}
