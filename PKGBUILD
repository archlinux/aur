# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: jtmb <packaging at technologicalwizardry dot com>
pkgname=msbuild
pkgver=16.0+xamarinxplat.2019.04.08.19.19
pkgrel=1
pkgdesc="Xamarin implementation of the Microsoft build system"
arch=('x86_64')
depends=('mono>=5.0.0')
makedepends=('libcurl-gnutls')
provides=('msbuild')
conflicts=('msbuild')
url="https://github.com/mono/msbuild"
license=('MIT')
source=("https://download.mono-project.com/sources/msbuild/msbuild-${pkgver}.tar.xz"
        'fix-install.patch')
sha256sums=('0d425603281ae84d3cf560ea4f9e2b2159e7764f71406035070a7fe27878ec49'
            '8780925e01d4e5bdf8f93c439fe92da7a64f14099b60382499b477a512b56dca')

prepare() {
    cd "${pkgname}-${pkgver%+*}"
    patch --forward --strip=1 --input="${srcdir}/fix-install.patch"
}

package() {
    cd "${pkgname}-${pkgver%+*}"
    make
    ./install-mono-prefix.sh "/usr" /p:StagingDir="${pkgdir}/usr" /p:TargetMSBuildToolsVersion="15.0"
}
