# Maintainer: Yuki Ibe <yibe\100yibe\056org>
pkgname=protobufjson
_reponame=ProtobufJson
pkgver=1.0.1
pkgrel=1
_commit=0799936266f73d636bb0d27f532527e1b2862c1f
pkgdesc="A simple CLI wrapper over the protobuf JSON API"
arch=('x86_64')
url="https://github.com/hq6/ProtobufJson"
license=('MIT')
makedepends=('git')
source=("git+${url}.git#commit=${_commit}"
        "https://github.com/protocolbuffers/protobuf/releases/download/v21.2/protobuf-cpp-3.21.2.tar.gz")
sha256sums=('SKIP'
            'c8944d00f72d850c91f1873213b09724c74a798ba3d5c23dc3c39f279a25c7d4')

build() {
  cd ./protobuf-3.21.2
  ./configure --prefix="$srcdir/$_reponame/lib/protobuf-3.21.2/dist"
  make
  make install
  cd ..

  cd "$_reponame"
  CXXFLAGS="$CXXFLAGS -Ilib/protobuf-3.21.2/dist/include" make
}

package() {
  cd "$_reponame"
  install -v -Dm755 ProtoToJson -t "$pkgdir/usr/bin/"
  install -v -Dm755 JsonToProto -t "$pkgdir/usr/bin/"
  install -v -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
