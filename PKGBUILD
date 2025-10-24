# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=llrt-container-bin
pkgver=0.7.0beta
_pkgver="${pkgver//beta/-beta}" # For GitHub urls
_pkgid="$pkgname-$_pkgver" # For filenames
pkgrel=1
pkgdesc='Lightweight JavaScript runtime (CONTAINER binary to be packaged with container images)'
arch=('x86_64' 'aarch64')
url='https://github.com/awslabs/llrt'
license=('Apache-2.0')
optdepends=(
  'llrt: LLRT CLI runtime, compiler, REPL, and test runner'
  'typescript: transpiler for TypeScript code with type checking support'
  'esbuild: fast compiler and bundler for JavaScript and TypeScript'
  'swc-js-bin: drop-in replacement for Babel with compilation and polyfill support'
  'bun-bin: fast runtime, compiler, and bundler for JavaScript and TypeScript'
  'aws-sam-cli: CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM')
provides=('llrt-container')
conflicts=('llrt-container')
source=(
  "$_pkgid-LICENSE::https://raw.githubusercontent.com/awslabs/llrt/refs/tags/v$_pkgver/LICENSE"
  "$_pkgid-THIRD_PARTY_LICENSES::https://raw.githubusercontent.com/awslabs/llrt/refs/tags/v$_pkgver/THIRD_PARTY_LICENSES"
  "$_pkgid-NOTICE::https://raw.githubusercontent.com/awslabs/llrt/refs/tags/v$_pkgver/NOTICE")
source_x86_64=(
  "llrt-container-x64-$_pkgver::$url/releases/download/v$_pkgver/llrt-container-x64"
  "llrt-container-x64-full-sdk-$_pkgver::$url/releases/download/v$_pkgver/llrt-container-x64-full-sdk"
  "llrt-container-x64-no-sdk-$_pkgver::$url/releases/download/v$_pkgver/llrt-container-x64-no-sdk")
source_aarch64=(
  "llrt-container-arm64-$_pkgver::$url/releases/download/v$_pkgver/llrt-container-arm64"
  "llrt-container-arm64-full-sdk-$_pkgver::$url/releases/download/v$_pkgver/llrt-container-arm64-full-sdk"
  "llrt-container-arm64-no-sdk-$_pkgver::$url/releases/download/v$_pkgver/llrt-container-arm64-no-sdk")
noextract=("${source_x86_64[@]%%::*}" "${source_aarch64[@]%%::*}")
sha256sums=(
  '58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd'
  '8b5f4183be83b323beab34c21b68add8535c482f939b03c9557dbafb75e92e47'
  '53c5c653b7164c02212717b494d8010704cf966286b5f6a6e6d185fe8d29ceaf')
sha256sums_x86_64=(
  'df2f122789e5bf9281a7bb4f99c83435a20ce9f1e3ba3053e71a9c20a906e123'
  'd21896b8aeffacd6e573ea0ce56269a767a7c06d0cd2081bb0b47f1e1b19697c'
  'abbdda0e2eea34e253425653e378b21c2c61de00e5a0c758ee86746a7a920dbc')
sha256sums_aarch64=(
  'cd9f78b00820b44421b568ff4672ca6937bd0a68372e3c5ac602edee839fd562'
  '75970fc090d9ef1143c97d1a207f16c17a68a4a334f5f156f04cbc3f8634af57'
  '332597cfa1777ea818cd1bc034650982ac4fcb14713ea38cf495c9a9d1b723d0')

package() {
  for file in llrt-container-*$_pkgver; do
    install -Dm755 "$srcdir/$file" "$pkgdir/usr/share/llrt/container/${file%-$_pkgver}"
  done
  
  for file in LICENSE THIRD_PARTY_LICENSES NOTICE; do
    install -Dm644 "$srcdir/$_pkgid-$file" "$pkgdir/usr/share/licenses/$pkgname/$file"
  done
}
