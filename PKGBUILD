# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=hunter-git
pkgver=1.3.5.r85.g17946cf
pkgrel=1
pkgdesc='Ranger-like CLI file browser written in Rust'
arch=('i686' 'x86_64')
url='https://github.com/nanoctr/hunter'
license=('custom:WTFPL')
provides=('hunter')
conflicts=('hunter')
depends=('gst-plugins-base-libs' 'libsixel')
makedepends=('rustup'
             'git'
             'gst-plugins-good'
             'gst-plugins-bad'
             'gst-plugins-ugly')
optdepends=('gst-plugins-good: Media support'
            'gst-plugins-bad: Media support'
            'gst-plugins-ugly: Media support'
            'gst-libav: Media support'
            'nerd-fonts-complete: Icon pack support'
            'bat: Syntax highlighting'
            'highlight: Syntax highlighting'
            'libarchive: Archive support'
            'p7zip: Archive support'
            'atool: Archive support'
            'w3m: HTML support'
            'links: HTML support'
            'elinks: HTML support'
            'lynx: HTML support'
            'poppler: PDF support'
            'mupdf-tools: PDF support'
            'fzf: Default file finder')
source=("hunter::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd hunter
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd hunter
  rustup override set nightly
  cargo build --release
}

package() {
  cd hunter
  install -D target/release/hunter{,-media} -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/hunter
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}
}
