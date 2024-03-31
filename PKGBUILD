# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=kubech
pkgver=1.1.0
pkgrel=1
pkgdesc='Set kubectl contexts/namespaces per shell/terminal to manage multi Kubernetes cluster at the same time.'
arch=('x86_64')
url='https://github.com/DevOpsHiveHQ/kubech'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DevOpsHiveHQ/kubech/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a1dbc0f8103a4b4a9fda4203b1b84b029144401a3d4284537b3b169804ef872')

build() {
  cd $pkgname-$pkgver
}

package() {
  mkdir -p $pkgdir/opt/kubech/completion
  install -Dm755 $srcdir/$pkgname-$pkgver/kubech "$pkgdir/opt/kubech/kubech"
  install -Dm755 $srcdir/$pkgname-$pkgver/kubechc "$pkgdir/opt/kubech/kubechc"
  install -Dm755 $srcdir/$pkgname-$pkgver/kubechn "$pkgdir/opt/kubech/kubechn"
  install -Dm755 $srcdir/$pkgname-$pkgver/completion/kubech.bash "$pkgdir/opt/kubech/completion/kubech.bash"
  install -Dm755 $srcdir/$pkgname-$pkgver/completion/kubechc.zsh "$pkgdir/opt/kubech/completion/kubechc.zsh"
  install -Dm755 $srcdir/$pkgname-$pkgver/completion/kubechn.zsh "$pkgdir/opt/kubech/completion/kubechn.zsh"
  
  mkdir -p $pkgdir/etc/profile.d
  echo "source /opt/kubech/kubech" > "$pkgdir/etc/profile.d/kubech.sh"
  install -Dm755 $srcdir/$pkgname-$pkgver/completion/kubech.bash "$pkgdir/usr/share/bash-completion/completions/kubech"
  install -Dm755 $srcdir/$pkgname-$pkgver/completion/kubechc.zsh "$pkgdir/usr/share/zsh/site-functions/_kubechc"
  install -Dm755  $srcdir/$pkgname-$pkgver/completion/kubechn.zsh "$pkgdir/usr/share/zsh/site-functions/_kubechn"
}

