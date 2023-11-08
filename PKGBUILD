# Maintainer: William Batista <bootlegbilly at protonmail dot ch>
pkgname="next_ls"
pkgver="0.15.0"
pkgrel="2"
pkgdesc="The language server for Elixir that just works."
arch=('x86_64' 'arm64')
url="https://github.com/elixir-tools/next-ls"
license=('MIT')
makedepends=('elixir')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elixir-tools/next-ls/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("724e316cbed6ec6505e12d40569ff26edf499031e249f699ff48fea6cac3098540830d955064f6e609c2471f35edec59ece175c543913e795e65f00c3ffdf55b")
package() {
  cd "${srcdir}/${pkgname}/"

  mix clean
  mix deps.get

  if [ $arch = "x86_64" ]; then
    export arch="amd64"
  fi
  
  MIX_ENV="prod" BURRITO_TARGET="linux_${arch}" mix release

  mkdir -p "${pkgdir}/usr/bin/"
  chmod +x "./burrito_out/next_ls_linux_$arch"
  mv "./burrito_out/next_ls_linux_$arch" "${pkgdir}/usr/bin/next_ls"
}
