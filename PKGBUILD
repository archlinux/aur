# Maintainer: Brett Gilio <mail@brettgilio.com>
pkgname=neuron
pkgver=7.5
pkgrel=2
pkgdesc="A flexible and powerful simulator of neurons and networks NEURON is a simulation environment for developing and exercising models of neurons and networks of neurons."
arch=('x86_64')
url="https://neuron.yale.edu/neuron/"
license=('GPL')
groups=('')
depends=('aarch64-linux-gnu-gcc>=5.2' 'ncurses5-compat-libs' 'libx11' 'openmpi' 'python' 'python-numpy' 'python-scipy')
options=('!strip' '!emptydirs')
source_x86_64=("https://neuron.yale.edu/ftp/neuron/versions/v7.5/nrn-7.5.tar.gz")
sha512sums_x86_64=('a4ad3e5b8a3ad7e480476232b32155b03c9dd313c22480690a96da3bd039b8d106f41e1907cbe4acdf153af297b98a195204bb5e8df46b5f911dde7fda08f131')

build() {
  cd "$srcdir/nrn-$pkgver"

  # We do this so the python libraries actually get installed in the package prefix
  sed -i "s_ac\_pysetup='--home=\$(prefix)'_ac\_pysetup='--home=$pkgdir/usr'_g" "$srcdir/nrn-$pkgver/configure"
  sed -i 's_exec\_prefix="${prefix}/${host\_cpu}"_exec\_prefix="${prefix}"_g' "$srcdir/nrn-$pkgver/configure"
	
  ./configure --prefix=/usr --libdir=/usr/lib --bindir=/usr/bin --with-paranrn --with-nrnpython=`which python` --without-iv
  make 
}

package() {
  cd "$srcdir/nrn-$pkgver"
  DESTDIR="$pkgdir"
  sed -i "s_package\_dir\ =\ {'':instdir+'/share/nrn/lib/python'}\,_package\_dir\ =\ {'':'$pkgdir/usr/share/nrn/lib/python'}\,_g" src/nrnpython/setup.py
  make DESTDIR="$pkgdir" install
  #rm -f "$pkgdir/usr/lib/libnrnmpi.la"
  #rm -f "$pkgdir/usr/lib/libmeschach.la"
  #rm -f "$pkgdir/usr/lib/libivoc.la"
  #rm -f "$pkgdir/usr/lib/libscopmath.la"
  #rm -f "$pkgdir/usr/lib/libneuron_gnu.la"
  #rm -f "$pkgdir/usr/lib/libmemacs.la"
  #rm -f "$pkgdir/usr/lib/libnrnoc.la"
  #rm -f "$pkgdir/usr/lib/libnrnpython.la"
  #rm -f "$pkgdir/usr/lib/liboc.la"
  #rm -f "$pkgdir/usr/lib/libnrniv.la"
  #rm -f "$pkgdir/usr/lib/libsundials.la"
  #rm -f "$pkgdir/usr/lib/libsparse13.la"
  #rm -f "$pkgdir/usr/lib/libocxt.la"
  
  cd "src/nrnpython/"
  python setup.py install --root="$pkgdir/"
}
sha512sums_x86_64=('08cef00a6d8edb379169344a88155393cc46c9d3c888c48aae336a5d2f413cd80a52d549eb794d10894e5357a4c2b16f973e1a7cfbaeee3b05599fb1d6ee33fe')
sha512sums_x86_64=('08cef00a6d8edb379169344a88155393cc46c9d3c888c48aae336a5d2f413cd80a52d549eb794d10894e5357a4c2b16f973e1a7cfbaeee3b05599fb1d6ee33fe')
