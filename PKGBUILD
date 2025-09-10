pkgname=charliecloud
pkgver=0.40
pkgrel=3
pkgdesc="A lightweight, fully unprivileged container implementation for HPC applications"
arch=('x86_64')
license=('Apache-2.0')
depends=(
    'python'
)
makedepends=(
    'bats'
    'cjson'
    'fuse3'
    'python-pip'
    'python-sphinx_rtd_theme'
    'shellcheck'
    'squashfuse'
    'squashfs-tools'
    'wget'
)
optdepends=(
    'bats: ch-test'
    'cjson: JSON features'
    'fuse3: ch-run internal SquashFS mounting'
    'git: ch-image using build cache'
    'nvidia-container-toolkit: ch-run inject nVidia GPU libraries'
    'rsync: ch-image using RSYNC intruction'
    'shellcheck: ch-test'
    'squashfs-tools: internal SquashFS mounting'
    'wget: ch-test'
)
source=("https://gitlab.com/charliecloud/charliecloud/-/archive/v${pkgver}/charliecloud-v${pkgver}.tar.gz")
sha1sums=('5d4d9f97172f7573ee28ecd49185823e19b28982')
url="https://charliecloud.io/"

build() {
    cd ${pkgname}-v${pkgver}
    ./autogen.sh
	CFLAGS="$CFLAGS -Wno-format-security" ./configure --enable-buggy-build --prefix=/usr
	make
}

package() {
    cd ${pkgname}-v${pkgver}
    make DESTDIR=${pkgdir} install
}
