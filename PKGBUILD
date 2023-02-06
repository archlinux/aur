pkgname=sqlconvert-tools
pkgdesc="sql database convert tools, mssql to sqlite or sqlite to mssql or mssql-transfer data"
pkgver=v0.0.4.r0.g9813239
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://github.com/vcup/MonitorFileSystem
license=('GPL3')
depends=('dotnet-runtime')
makedepends=('git' 'dotnet-sdk')
source=(
  'git+https://github.com/vcup/SqlConvertTools'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/SqlConvertTools"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare(){
  cd "${srcdir}/SqlConvertTools"
  # git submodule update --init --recursive
}
check(){
  cd "${srcdir}/SqlConvertTools"
}
build(){
  cd "${srcdir}/SqlConvertTools"
  dotnet restore ./SqlConvertTools.sln
  dotnet publish ./SqlConvertTools/SqlConvertTools.csproj -c "Release" \
    --nologo --force --output ./out
}
package(){
  mkdir -p "${pkgdir}/opt/sqlconvert-tools"
  mkdir -p "${pkgdir}/usr/bin"

  cd "${srcdir}/SqlConvertTools/out"
  cp -a * "${pkgdir}/opt/sqlconvert-tools"

  ln -sf /opt/sqlconvert-tools/SqlConvertTools "${pkgdir}/usr/bin/sqlconvert-tools"
}
