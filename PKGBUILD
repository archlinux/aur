# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=cyclonedx-cli
pkgver=0.33.1
pkgrel=1
pkgdesc="CycloneDX CLI tool for SBOM analysis, merging, diffs and format conversions"
arch=("x86_64")
url="https://github.com/CycloneDX/cyclonedx-cli"
license=("Apache-2.0")
makedepends=(
  "dotnet-sdk"
  "git"
)
options=("!strip" "!debug")
source=("${pkgname}::git+https://github.com/CycloneDX/cyclonedx-cli#tag=v${pkgver}")
b2sums=('8e5ae27c19bd5fc133f0a17793ebc84aff210032e575a8c8d071262457b4afcd8998507ddded2a9144319541be925143b5c2e42108e880948193de5f37bce163')

build() {
  cd "${srcdir}/${pkgname}"
  dotnet publish src/cyclonedx/cyclonedx.csproj \
    -r linux-x64
    --configuration Release \
    --self-contained true \
    /p:PublishSingleFile=true \
    /p:IncludeNativeLibrariesInSingleFile=true \
    /p:IncludeNativeLibrariesForSelfExtract=true \
    --output bin/linux-x64
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}/bin/linux-x64/cyclonedx"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/${pkgname}/LICENSE"
}
