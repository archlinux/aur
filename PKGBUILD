# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=helm-unittest
_pluginname=unittest
pkgname=$_pkgname-bin
pkgver=1.2.1 # renovate: datasource=github-releases depName=helm-unittest/helm-unittest
pkgrel=1
pkgdesc="Unit test for helm chart in YAML to keep your chart functional and robust"
url="https://github.com/helm-unittest/helm-unittest"
license=('MIT')
depends=('helm')
source_x86_64=(
  "$_pkgname-$pkgver-x86_64.tgz::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64-$pkgver.tgz"
)
source_aarch64=(
  "$_pkgname-$pkgver-aarch64.tgz::$url/releases/download/v$pkgver/${_pkgname}-linux-arm64-$pkgver.tgz"
)
arch=('x86_64' 'aarch64')
sha512sums_x86_64=('b4af54e63438a2e948005fb304ac9d675e6b854dfd0f0a54400117d5aeee912ad90a8cf76e94e62ab6e43dc6337c04d67c9c8ccaae71497f4f7acc8a6784e9b0')
sha512sums_aarch64=('9f8df991cd4ecad9cceb0080047105d4e6d0a200229b9d994625d15497800ed51ffbc7da172ba326fa8bb77976b29f41d03dfa56e3a53457ae9f0bf99fad7ccf')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
install=$pkgname.install

package() {
  case "$CARCH" in
    x86_64)   _bin="untt-linux-amd64" ;;
    aarch64)  _bin="untt-linux-arm64" ;;
  esac
  sed -i '/^platformHooks:$/Q' "$srcdir/plugin.yaml"
  install -D -m 0755 "$srcdir/$_bin" "$pkgdir/usr/lib/helm/plugins/$_pluginname/$_bin"
  install -D -m 0644 "$srcdir/plugin.yaml" "$pkgdir/usr/lib/helm/plugins/$_pluginname/plugin.yaml"
}

#vim: syntax=sh
