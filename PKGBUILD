#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=analizo
pkgver=1.18.1
pkgrel=1
pkgdesc="Analizo is a free, multi-language, extensible source code analysis and visualization toolkit."
groups=('analizo')
arch=('any')
url="http://analizo.org"
license=('GPLv3')
depends=('perl' 'perl-cpanplus-dist-arch' 'sloccount' 'doxyparse')
makedepends=('git')
source=("${url}/download/${pkgname}_${pkgver}.tar.xz")
sha512sums=('2184796a58a0d8ffe52c8dcb551c620986194926437ea99ab18cad6a014346b766bec26f6848579051686ac1562c50ab19d5d164afe6c4ec78ebe958d0ee4a9c')

build(){
  cd "${srcdir}/${pkgname}"

  #Perl modules
  cpanp -i --skiptest Class::Accessor
  cpanp -i --skiptest Getopt::Euclid
  cpanp -i --skiptest Graph
  cpanp -i --skiptest List::Compare
  cpanp -i --skiptest Statistics::Descriptive
  cpanp -i --skiptest Statistics::OnLine
  cpanp -i --skiptest MRO::Compat
  cpanp -i --skiptest Test::Class
  cpanp -i --skiptest Test::Exception
  cpanp -i --skiptest YAML
  cpanp -i --skiptest File::ShareDir::Install
  cpanp -i --skiptest FindBin::libs
  cpanp -i --skiptest App::Cmd::Setup
  cpanp -i --skiptest Class::Inspector
  cpanp -i --skiptest Graph::Writer::DSM
  cpanp -i --skiptest File::HomeDir
  cpanp -i --skiptest CHI
  cpanp -i --skiptest File::Copy::Recursive
  cpanp -i --skiptest Params::Util
  cpanp -i --skiptest List::MoreUtils
  cpanp -i --skiptest Data::UUID
  cpanp -i --skiptest Params::Validate
  cpanp -i --skiptest Digest::JHash

  #Analizo
  perl Makefile.PL
  make
}

package(){
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}/" install

  ln -s /usr/bin/site_perl/analizo ${pkgdir}/usr/bin/analizo
}