# Maintainer: Yuki Ibe <yibe\100yibe\056org>
pkgname=protobufjson
_reponame=ProtobufJson
pkgver=0.1.0_alpha
pkgrel=1
_commit=ed6aecb8ae92d0fb130e316c0714337356f166e4
pkgdesc="A simple CLI wrapper over the protobuf JSON API"
arch=('x86_64')
url="https://github.com/hq6/ProtobufJson"
license=('MIT')
depends=('protobuf>=22.0')
makedepends=('git')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd "$_reponame"
  sed -e 's@google/protobuf/stubs/strutil\.h@absl/strings/escaping.h@' \
      -e 's@google::protobuf::Base64Unescape@absl::Base64Unescape@' \
      -i ./ProtobufJson.cc
}

build() {
  cd "$_reponame"
  make CXXFLAGS=-std=c++17 LDLIBS='-lprotobuf -labsl_status -labsl_strings'
}

package() {
  cd "$_reponame"
  install -v -Dm755 ProtobufJson -t "$pkgdir/usr/bin/"
  install -v -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
