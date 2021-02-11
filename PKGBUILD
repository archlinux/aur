# Maintainer: Sebastian Werner
pkgname=wskdeploy-git
pkgrel=1
pkgver=1.1.0
pkgdesc="Apache OpenWhisk utility for deploying and managing OpenWhisk projects and packages."
arch=('i686' 'x86_64')
url="https://github.com/apache/incubator-openwhisk-wskdeploy"
license=('Apache')
replaces=('wskdeploy-git')
conflicts=('wskdeploy-git')
source=($pkgname-src.tar.gz::https://github.com/apache/openwhisk-wskdeploy/archive/1.1.0.tar.gz)
noextract=($pkgname-src.tar.gz)
makedepends=("go" "git")
md5sums=('SKIP')

prepare(){
  mkdir -p gopath/src/github.com/apache/openwhisk-wskdeploy 

  # the dependencies can be fetched here if needed
  cd gopath/src/github.com/apache/openwhisk-wskdeploy 

}

build() {
  
  tar xvfz $pkgname-src.tar.gz -C gopath/src/github.com/apache/openwhisk-wskdeploy --strip-components=1
  cd "$srcdir/gopath/src/github.com/apache/openwhisk-wskdeploy"
  
	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" \
    -o wskdeploy
}

package() {
  cd "$srcdir/gopath/src/github.com/apache/openwhisk-wskdeploy"
  #mkdir -p "$pkgdir/usr/bin" 
  install -Dm755 "wskdeploy" "$pkgdir/usr/bin/wskdeploy"
}
