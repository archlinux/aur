# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=mercurial-cli-templates-hg
pkgver=r13.66e2a34005b4
pkgrel=1
pkgdesc='Three new templates for Mercurial'
arch=('any')
url='https://bitbucket.org/sjl/mercurial-cli-templates/'
license=('unknown')
depends=('mercurial')
source=('hg+https://bitbucket.org/sjl/mercurial-cli-templates')
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-hg}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	for template in "$srcdir"/"${pkgname%-hg}"/map-cmdline.*; do
		echo "$template"
		install -D -m644 "$template" "$pkgdir/usr/lib/python2.7/site-packages/mercurial/templates/$(basename "$template")"
	done
	install -d "$pkgdir/etc/mercurial/hgrc.d"
	cat <<- 'EOF' > "$pkgdir/etc/mercurial/hgrc.d/mercurial-cli-templates.rc"
	[alias]
	dlog = log -Tdlog
	nlog = log -Tnlog
	slog = log -Tslog
	sglog = log -Tsglog
	EOF
}

# vim: noet:ts=4:sw=4
