# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname=fastvideods-encoder

pkgver=1.0.1
pkgrel=1

pkgdesc="Encoder for the FastVideoDS format"
arch=(i686 x86_64)

url="https://github.com/bemxio/FastVideoDSEncoder-Linux"
license=("unknown")

depends=(dotnet-runtime dotnet-sdk ffmpeg-compat-59)
provides=(FastVideoDSEncoder)

source=(https://github.com/bemxio/FastVideoDSEncoder-Linux/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=("6b3b190eed0e5a2e3de0315754dbf0f2")

build() {
	# move to the source directory
	cd FastVideoDSEncoder-Linux-${pkgver}

	# build the project
	dotnet build FastVideoDS.sln --property:Configuration=Release --output Build/
}

package() {
	# move to the source directory
	cd FastVideoDSEncoder-Linux-${pkgver}

	# make the required directories
	mkdir -p ${pkgdir}/opt/fastvideods-encoder/
	mkdir -p ${pkgdir}/usr/bin/

	# copy the build files to the package directory
	mv Build/* ${pkgdir}/opt/fastvideods-encoder/

	# make a symlink to the executable
	ln -s /opt/fastvideods-encoder/FastVideoDSEncoder ${pkgdir}/usr/bin/FastVideoDSEncoder
}