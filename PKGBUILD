# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='basicanalysis'
pkgdesc='Framework for automatic extraction of fundamental factors for Paraver traces (from BSC).'
pkgver='2026.09.15'
pkgrel='1'
arch=('any')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL-2.1-or-later')
depends=(python wxparaver dimemas
         python-pandas python-seaborn python-matplotlib python-numpy python-scipy
         python-plotly python-yaml)
optdepends=('gnuplot: Drawing the generated plots'
            'chromium: Exporting reports to PDF')
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(2c42dd797502d86b249c6dc8fdf86a79392021b72aebfb91589923349d71ff3b63c88f7392c7a4a06a5a26fcde03ba75bd4480a957f1c5a6567bb412485075cd)

package() {
	# Install the whole source tree in /usr/lib/basicanalysis
	cd "$srcdir/$pkgname-$pkgver"
	local instdir="$pkgdir/usr/lib/basicanalysis"

	install -d -m755 "$instdir"
	cp -a . "$instdir/"

	# Create symlinks to the user-facing scripts in /usr/bin for ease of use
	mkdir -p "$pkgdir/usr/bin"
	chmod 0755 "$pkgdir/usr/bin" "$pkgdir/usr"
	for script in modelfactors.py analyze_trace.py merge_trace_results.py \
	              compute_metrics_from_merged.py html_to_pdf.py; do
		ln -s "/usr/lib/basicanalysis/$script" "$pkgdir/usr/bin/$script"
	done
}
