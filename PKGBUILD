# Maintainer: Ricardo Wurmus <maintainer name + @gmail.com>
pkgname=soundcli
pkgver=0.0.5
pkgrel=2
pkgdesc="Command line interface to stream/download songs from soundcloud.com"
url="http://soundcli.elephly.net"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('ruby' 'ruby-gstreamer' 'ruby-curb' 'ruby-json' 'gstreamer0.10-good')
makedepends=(rubygems)
source=(https://github.com/rekado/soundCLI/tarball/$pkgver)
md5sums=('1422280932a7e30fa3545e0a00947d99')

build() {
  # github names the directory in a funny way...
  cd $srcdir/rekado-soundCLI-1575db9

  msg "Configuring source..."

  ruby ./setup.rb config --prefix=${pkgdir}/usr \
    --siterubyver=${pkgdir}/usr/lib/ruby/site_ruby/1.9.1/ \
    --sysconfdir=${pkgdir}/etc

  msg "Running setup..."
  ruby ./setup.rb setup
}

package() {
  msg "Installing files..."
  cd $srcdir/rekado-soundCLI-1575db9
  ruby ./setup.rb install
}
