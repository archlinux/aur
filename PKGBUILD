# Maintainer: Jackson Massey <jackmassey2000@gmail.com>
_name=garak
pkgname=python-$_name
pkgver=0.14.0
pkgrel=1
pkgdesc="The LLM Vulnerability Scanner - Generative AI Red-teaming & Assessment Kit"
arch=('any')
url="https://github.com/NVIDIA/garak"
license=('Apache-2.0') 
depends=('python')
makedepends=('python-pip' 'python-virtualenv')
options=('!strip' '!zipman')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  :
}

package() {
  cd "$_name-$pkgver"
  
  install -dm755 "$pkgdir/opt/$pkgname"
  python -m venv "$pkgdir/opt/$pkgname"
  
  "$pkgdir/opt/$pkgname/bin/pip" install --no-cache-dir .
  
  find "$pkgdir/opt/$pkgname/bin" -type f -exec sed -i "s|$pkgdir||g" {} +
  
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/garak" "$pkgdir/usr/bin/garak"
}
