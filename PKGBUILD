pkgbase=falco-plugins-git
_pkgname=plugins
pkgname=(falco-plugin-container-git falco-plugin-json-git falco-plugin-k8saudit-git)
pkgver=0.6.4
pkgrel=1
arch=('x86_64')
url="https://github.com/falcosecurity/plugins"
license=('Apache-2.0')
makedepends=('git' 'go' 'make')
source=('git+https://github.com/falcosecurity/plugins.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/.*\/v//;s/.*\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  echo "Building plugin: container"
  cd "$srcdir/$_pkgname/plugins/container"
  make libcontainer.so
 
  echo "Building plugin: json"
  cd "$srcdir/$_pkgname/plugins/json"
  make libjson.so
 
  echo "Building plugin: k8saudit"
  cd "$srcdir/$_pkgname/plugins/k8saudit"
  make libk8saudit.so

}


package_falco-plugin-container-git() {
  pkgdesc="Falco plugin for container"
  provides=("falco-plugin-container")
  conflicts=("falco-plugin-container")
  cd "$srcdir/$_pkgname/plugins/container"
  install -Dm755 "libcontainer.so" "$pkgdir/usr/share/falco/plugins/libcontainer.so"
}
 
package_falco-plugin-json-git() {
  pkgdesc="Falco plugin for json"
  provides=("falco-plugin-json")
  conflicts=("falco-plugin-json")
  cd "$srcdir/$_pkgname/plugins/json"
  install -Dm755 "libjson.so" "$pkgdir/usr/share/falco/plugins/libjson.so"
}
 
package_falco-plugin-k8saudit-git() {
  pkgdesc="Falco plugin for k8saudit"
  provides=("falco-plugin-k8saudit")
  conflicts=("falco-plugin-k8saudit")
  cd "$srcdir/$_pkgname/plugins/k8saudit"
  install -Dm755 "libk8saudit.so" "$pkgdir/usr/share/falco/plugins/libk8saudit.so"
}

