# Maintainer: Hao Long <aur@esd.cc>

pkgname=rsactftool-git
pkgver=r1097.56a71b9
pkgrel=1
pkgdesc="RSA attack tool (mainly for ctf) - retreive private key from weak public key and/or uncipher data"
arch=("any")
url="https://github.com/Ganapati/RsaCtfTool"
license=('GPL-3.0-or-later')
depends=("python-pycryptodome"
  "python-gmpy2"
  "python-sympy"
  "python-requests"
  "python-six"
  "python-psutil"
  "python-cryptography")
optdepends=('sagemath: for boneh_durfee / ecm / ecm2 / qicheng / smallfraction attack')
makedepends=('git')
provides=('rsactftool')
conflicts=('rsactftool')
source=("$pkgname::git+$url"
  'rsactftool-launch-script')
sha256sums=('SKIP'
  '2f3cebc4d30867bddaa38b3517357298e74c5b4562c04afe65dca6a9ee6dcb44')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p $pkgdir/usr/share/
  cp -r $pkgname $pkgdir/usr/share/$pkgname
  rm -rf $pkgdir/usr/share/$pkgname/.git/
  install -Dm755 rsactftool-launch-script $pkgdir/usr/bin/rsactftool
}
