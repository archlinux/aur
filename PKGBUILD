# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=horizon
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=20.0.0
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
	python-hacking
	python-coverage
	python-freezegun
	python-nodeenv
	python-pytest
	python-pytest-django
	python-pytest-html
	python-memcached
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
md5sums=('269a8454499c9828bc2bff924f4d3db3'
         '0fd71d7f09bef8620b17a23b703e5db1'
         'a7e1458d7f9697060175f88c10568a5e'
         '73641056e201c4361995b058df692e1d'
         '94282686c3903ff4a15e75c519186541'
         'ca5311dc0f58af1e2f5a306038128ce7'
         'c656448ba05ca49ffc6897d4e92e64d8')
sha256sums=('9abbc4fbb39a5bf3b473651eca7aafa273c07511fb38d5d69680a0d9fdba8777'
            '30272a1395e1bbbfd97b97a5e54e57a470921991978ac0bc09a65750211e035e'
            'ee1d5deb3da6dfb9f8995a34e05ff99ce12405b634a9efdb053f338127944f73'
            '2081b7cf3c7159422251837fc5c1d84f93501164070ebf9a18f41b03a6152bcb'
            'be5b591bde6abef4b445170a2cef4325106e516c5adf15d3de6cd7f34753dc6f'
            'fab8d2aaf442c5e7760808a72a1e3209f3099377a7ae9fa7eb1d446effdcdee3'
            'bef6fe090baba05e6a72fb118ba709eb945133ae8094ad5aa932bbf76a9ffe23')
sha512sums=('6cef68ce2d1f917fcf95f132205670657a8ee94eadf4b07f53a24d1f13ce8ab8859a8e7b1dded4d08bc91174e90a58b99a7e7f6ca0748c79d2462c267ca1a571'
            'c19c20c56b48788661b19536fb2c710d34facb4a0e50d59fea4794ff04fce4e3961fa57b3fcbc823b86df8dfb8ed376698149773079b0a9d05e9a2c5decc3d9f'
            'ad9b72252cdd3ba9b3833b3ba78918907c67000ea935998bddb53ab0352fb5c7f883aa89ce3b93bdbcfac80e9e93013b5b69e52ee426cd26a29ec37ecb7f0ad9'
            '3c2e632ca4c0f496aa0455db1db06d97a3a04bb9644d9d5d1095f578722edc1455d24682992a83576d36894bc0521968fec4a1ca369c5a427d02515a2022288e'
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
	sphinx-build -b html doc/source doc/build/html
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
	pkgdesc="${pkgdesc} Documents"
	depends=()
	cd $_pyname-$pkgver
	DOCDIR=$pkgdir/usr/share/doc
	mkdir -p "$DOCDIR"
	cp -r doc/build/html "$DOCDIR/$pkgbase"
	rm -r "$DOCDIR/$pkgbase/.doctrees"
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"
