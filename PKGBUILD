# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=horizon
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=19.1.0
pkgrel=1
pkgdesc="OpenStack Dashboard"
arch=('any')
url="https://docs.openstack.org/horizon/latest/"
license=('Apache')
depends=(
	gettext
	python
	python-pbr
	python-babel
	python-debtcollector
	python-django
	python-django-compressor
	python-django-debreach
	python-django-pyscss
	python-futurist
	python-iso8601
	python-keystoneauth1
	python-netaddr
	python-oslo-concurrency
	python-oslo-config
	python-oslo-i18n
	python-oslo-policy
	python-oslo-serialization
	python-oslo-upgradecheck
	python-oslo-utils
	python-osprofiler
	python-pymongo
	python-pyscss
	python-cinderclient
	python-glanceclient
	python-keystoneclient
	python-neutronclient
	python-novaclient
	python-swiftclient
	python-pytz
	python-pyaml
	python-requests
	python-semantic-version
	python-xstatic
	python-xstatic-angular
	python-xstatic-angular-bootstrap
	python-xstatic-angular-fileupload
	python-xstatic-angular-gettext
	python-xstatic-angular-lrdragndrop
	python-xstatic-angular-schema-form
	python-xstatic-bootstrap-datepicker
	python-xstatic-bootstrap-scss
	python-xstatic-bootswatch
	python-xstatic-d3
	python-xstatic-hogan
	python-xstatic-font-awesome
	python-xstatic-jasmine
	python-xstatic-jquery
	python-xstatic-jquery-migrate
	python-xstatic-jquery-quicksearch
	python-xstatic-jquery-tablesorter
	python-xstatic-jquery-ui
	python-xstatic-jsencrypt
	python-xstatic-mdi
	python-xstatic-objectpath
	python-xstatic-rickshaw
	python-xstatic-roboto-fontface
	python-xstatic-smart-table
	python-xstatic-spin
	python-xstatic-termjs
	python-xstatic-tv4
	python-enmerkar
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-reno
	python-sphinx
	python-doc8
	python-mock
	python-pytest
)
checkdepends=(
	ffmpeg
	firefox
	xorg-server-xvfb
	bandit
	python-hacking
	python-coverage
	python-flake8-import-order
	python-nodeenv
	python-pytest
	python-pytest-django
	python-pytest-html
	python-memcached
	python-pylint
	python-selenium
	python-testscenarios
	python-testtools
	python-xvfbwrapper
)
source=(
	"https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
	0000-fix-removed-available_attrs.patch
	0001-fix-removed-curry.patch
	0002-set-default-not-debug.patch
	wsgi-horizon.conf
	tmpfiles.conf
	sysusers.conf
)
md5sums=('b4c87f5fbf870e4459a3047e629b6a90'
         '8bf40e8faa9a7bfc60ba1a65f5f64fb6'
         'bd6347e135ed9117221dfe676eec3e34'
         '1a6b8d9735574f2a73ac6f8866a37d2b'
         '94282686c3903ff4a15e75c519186541'
         'ca5311dc0f58af1e2f5a306038128ce7'
         'c656448ba05ca49ffc6897d4e92e64d8')
sha256sums=('b789efa026f3af7f2cef71ff70c6393cfbfc88bd88ba1ea1eb4c7186b8c5c801'
            '6546c140ad4b28e8f91583dfa0df3804794747e18cad373e51f5bc31ad779c29'
            'f5a1d5fd707b5e8ef43960553a2eb7a47f0ef293588d90a772d2f3605277f81b'
            '659d28b7d0be1ebc3439d35e0d1ec948cc37d2f4284804037fe8fdc33c03c04f'
            'be5b591bde6abef4b445170a2cef4325106e516c5adf15d3de6cd7f34753dc6f'
            'fab8d2aaf442c5e7760808a72a1e3209f3099377a7ae9fa7eb1d446effdcdee3'
            'bef6fe090baba05e6a72fb118ba709eb945133ae8094ad5aa932bbf76a9ffe23')
sha512sums=('2fbf520f4e0f973e3c636fddf54b9b4eb0ec728f1e3a4aac42172bf820aeb269887e625045a8cdbccd065e3d5c80ccb5dfd347b96355eabde4a865c94479b8a6'
            '737bbe91d0b4a2ada993e15265116a3521e222fb1c7a344b51f8172e3ae04329a12457c22173411eb9ea4f89a8c43a175821ef6f63b67b1172408e6d3ab0ce83'
            '4d9969425204263aa8711f16c24ff6f630bd30147cc5d612194c82fafad88887af01f79f145cd402b74921ee34a2fb10d89890d33ee06a2663e2b42212e1ec12'
            '51d423568dba81b2d90c81ec4e0d0e7ebb7be0c64994591c02021d1a56a41715c6db30e4e285a7fb44007d73f9eb06aa2f24ab5429c9da68e70d6eb9e6bd78a5'
            'd2fc3f55fcd224127c18b904be724da6eaeaf1ac7841b1415df038e192a91d6b18421ab17aae817bbbba5a8492e98f96e73539dd1f356c9c844abe141ef31a50'
            '127e9a9eb8ee19773ee579d86cf19bf8d41be1d222a7a241a3f36b4091d965249f96afba44cded8c79eeb10733f79b7b78bc8beb2c9446e43774a31bd5a04bf4'
            '58567414da7c38c5987158f2206e7b13617565944b233381faf3576b7124e4e2dc4244c55c791b104d047f2450ce55379c935e259af4f387b1415e60a972f29d')

export PBR_VERSION=$pkgver

prepare(){
	for i in "${source[@]}"
	do case "${i}" in
		?*.patch)
			msg2 "Apply patch ${i}"
			patch -Np1 <"${i}"
		;;
	esac
	done
}

build(){
	cd $_pyname-$pkgver
	python setup.py build
	#sphinx-build -b html doc/source doc/build/html
}

#check(){
#	cd $_pyname-$pkgver
#	PYTHONPATH=${PWD} stestr run
#}

_package_pkg(){
	optdepends=(
		"apache: wsgi api support"
		"mod_wsgi: apache wsgi support"
		"python-openstackclient: OpenStack CLI Client"
		"${pkgbase}-doc: Documents for ${pkgdesc}"
	)
	backup=(
		etc/httpd/conf/extra/wsgi-horizon.conf
		etc/openstack-dashboard/local_settings
	)
	cd $_pyname-$pkgver
	export PYTHONPATH=${PWD}
	_DATADIR="$pkgdir/usr/share"
	DATADIR="$_DATADIR/$pkgname"
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir"/usr/lib/tmpfiles.d/$_pyname.conf
	install -Dm644 "$srcdir/sysusers.conf" "$pkgdir"/usr/lib/sysusers.d/$_pyname.conf
	install -Dm644 "$srcdir/wsgi-horizon.conf" -t "$pkgdir/etc/httpd/conf/extra"
	install -Dm644 "$srcdir/wsgi-horizon.conf" -t "$DATADIR"
	install -Dm644 openstack_dashboard/local/local_settings.py.example "$pkgdir/etc/openstack-dashboard/local_settings"
	install -Dm755 manage.py -t "${DATADIR}"
	mv ${pkgdir}/usr/lib/python3.*/site-packages/openstack_dashboard "${DATADIR}/"
	ln -s /etc/openstack-dashboard/local_settings "${DATADIR}/openstack_dashboard/local/local_settings.py"
}

_package_doc(){
	pkgdesc="OpenStack Image Service Documents"
	depends=()
	cd $_pyname-$pkgver
	mkdir -p "${pkgdir}/usr/share/doc"
	#cp -r doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"
