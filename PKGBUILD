# Maintainer: gigas002 <gigas002@pm.me>

pkgname=docfx-git
_pkgname=docfx
pkgver=r4367.0f4a61eb87
pkgrel=1
pkgdesc="Tools for building and publishing API documentation for .NET projects"
arch=('x86_64')
url="https://github.com/dotnet/docfx"
license=('MIT')
groups=()
makedepends=('git' 'dotnet-sdk>=7.0.4')
checkdepends=()
optdepends=()
provides=("docfx")
conflicts=("docfx")
replaces=()
backup=()
options=(!strip)
source=(git+"${url}".git#branch=main)
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# prepare() {
#     git clone --single-branch --branch main "${url}"
# }

build() {
    cd "${srcdir}/docfx/src/docfx"
    dotnet publish -c Release --os linux -f net7.0 /p:PublishDir=../../publish/linux-x64 /p:PublishSingleFile=true /p:IncludeAllContentForSelfExtract=true
}

package() {
	install -d ${pkgdir}/usr/bin
    cp ${srcdir}/docfx/publish/linux-x64/docfx ${pkgdir}/usr/bin/docfx
}
