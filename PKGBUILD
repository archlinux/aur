# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=helm-unittest
_pluginname=unittest
pkgname=$_pkgname-bin
pkgver=1.1.1 # renovate: datasource=github-releases depName=helm-unittest/helm-unittest
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
sha512sums_x86_64=('32a1868108c31e837d6da8fe12945f71d12c2276209ef5c94a4faed68591f699c2df358cb23edc9592326338da6bccb878eb01fdf1309916db0e1ec4283e5989')
sha512sums_aarch64=('33d6eb3d13be3bb3bf28309ee9e809a3bdfab858f8bbb5fd2cad143ad7bc0a659d0a6531024f3144ad32a7a44ce96cdd0117d7ad61e0aca660908c5bdb07bedc')
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
