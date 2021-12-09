# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname=istio-bin
_pkgname=istio
pkgver=1.12.1
pkgrel=1
pkgdesc='An open platform to connect, manage, and secure microservices'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://istio.io'
license=('Apache')
depends=('bash' 'glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

_source_base="https://github.com/istio/istio/releases/download/$pkgver"

source_x86_64=("$_source_base/istio-$pkgver-linux-amd64.tar.gz")
source_armv7h=("$_source_base/istio-$pkgver-linux-armv7.tar.gz")
source_aarch64=("$_source_base/istio-$pkgver-linux-arm64.tar.gz")

sha256sums_x86_64=('7b1279810a77590bd7af60d6d26074a89c32e6aff7512fdc37f38b093e34e382')
sha256sums_armv7h=('4ce7de62c740414e5f17f8e931476a76ce2b5ff6fdca673c7d2cd674625e932b')
sha256sums_aarch64=('9e8d53fd0d94a744e7eaab8e72bf3eddb76e85d5869a6550397cf2a7df5ee981')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm755 "bin/istioctl" "$pkgdir/usr/bin/istioctl"
  install -Dm644 "tools/_istioctl" "$pkgdir/usr/share/zsh/site-functions/_istioctl"
  install -Dm644 "tools/istioctl.bash" "$pkgdir/usr/share/bash-completion/completions/istioctl"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -d "$pkgdir/usr/share/$_pkgname"
  for d in manifests samples tools; do
    cp -R "$d" "$pkgdir/usr/share/$_pkgname/"
  done
}
