# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Fernando Nogueira <mrfernando2509@gmail.com>

pkgname=supabase-git
pkgver=1.4.9.r0.gaa6a512
pkgrel=1
pkgdesc="CLI for Supabase, an open source Firebase alternative"
arch=(x86_64)
url="https://supabase.com/docs/reference/cli/about"
license=(MIT)
makedepends=(git go)
provides=(supabase)
conflicts=(supabase)
options=(!lto)
source=("supabase-cli::git+https://github.com/supabase/cli.git")
sha256sums=('SKIP')

pkgver() {
  cd supabase-cli
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd supabase-cli
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o supabase
}

package() {
  cd supabase-cli
  install -Dm755 supabase -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}