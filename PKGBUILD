# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname=istio-bin
_pkgname=istio
pkgver=1.14.2
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

sha256sums_x86_64=('53ec5d3442a106eb003bbfa1f323dbde7280888b3091a3bfb35febc86d4bd301')
sha256sums_armv7h=('820b3cda81eaba01c38a55312fa46ac663adb6b3bd48896eaac716d9b4a29e74')
sha256sums_aarch64=('56b3baae4ad56609e3ec8609663a2202b07148be6d40507c84322ffe4aadbd52')

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
