# Maintainer: Jiri Pinkava <j-pi at seznam.cz>

pkgname=kubeflow-kfctl
pkgver=1.1.0
_commit=d878d4d45863e42fd5cff6743294a11d28a9abce
pkgrel=1
pkgdesc="A tool to control and manage Kubeflow deployments"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/kubeflow/kfctl"
depends=('glibc')
makedepends=('go' 'git')
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kubeflow/kfctl/archive/v${pkgver}.tar.gz")
sha256sums=('b8765c128a9a0f3fabb5e77080bf4f139b0138454ea4313dbfdeb96c0adf9d39')

prepare() {
    cd "kfctl-$pkgver"
    patch -p0 --input="${srcdir}/../print.patch"
}

build() {
  cd kfctl-${pkgver}
  make
}

package() {
  install -Dm755 "$srcdir/kfctl-${pkgver}/bin/kfctl" -T "$pkgdir/usr/bin/kfctl"
}
