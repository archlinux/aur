# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='basicanalysis'
pkgdesc='Framework for automatic extraction of fundamental factors for Paraver traces (from BSC).'
pkgver='2026.09.17'
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
sha512sums=(b5c7b5a907c587eef1147d3dcdff1f71b9f170a21715eae19ca18ce72d282110de74c1fec01d5cc19f3c4c3592d64a8b1df1d2973717729aace4c1212c2b5573)

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
