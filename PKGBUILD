# Maintainer: pallxk <aur@pallxk.com>
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux

pkgname=azure-cli
pkgver=2.0.77
pkgrel=1
pkgdesc="Command-line tools for Azure."
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
makedepends=("python")
conflicts=("python-azure-cli")
source=("https://azurecliprod.blob.core.windows.net/install.py"
        "install.response"
        "az")
sha256sums=("9dc76481771bb2e219217187a1331a85a426e685d4070867a42d5825956ee512"
            "7c05e9915a52fb72fa8d1c498b173c42457d669351313eaddccf43f86ed0e0ec"
            "990f70efec828c1e1f3f57748fc6e40f9705f2223dc96683e8e29d118daac116")

build() {
  grep -v -E '^===>|^$' install.response | python "$srcdir/install.py"
}

package() {
  mkdir "$pkgdir/opt"
  cp -r azure-cli "$pkgdir/opt"

  mkdir -p "$pkgdir/usr/bin"
  cp az "$pkgdir/usr/bin"
}
