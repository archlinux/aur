# Maintainer: Manu Sánchez (Manu343726) <Manu343726.public@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=biicode
pkgver=3.5
pkgrel=1
pkgdesc="Simple C/C++ file-based dependency manager"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/biicode/biicode/"
license=('MIT')
makedepends=('git')
depends=('cmake' 'zlib' 'sqlite'
         'python2-pmw' 'python2-pymongo'
         'python2-yaml' 'python2-graph'
         'python2-colorama' 'python2-jinja'
         'python2-pyserial')
options=('!strip')
source=("git+https://github.com/adamnovak/biicode.git#commit=e94d973be22550b45f1ddf7dc3e2da817ebd86e3"
        )
sha256sums=('SKIP')

prepare()
{
  cd biicode
  git submodule update --init --recursive
  mv bii-server server
  rm -rf common/test/resources/hello*
}

build(){
  cd biicode
  python2 -m compileall ./
}
package()
{
  cd biicode
  install -d $pkgdir/usr/bin
  install -d $pkgdir//usr/lib/python2.7/site-packages/biicode
  mv * $pkgdir/usr/lib/python2.7/site-packages/biicode

  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
  #!/usr/bin/bash
  python2 /usr/lib/python2.7/site-packages/biicode/bii

END
}
