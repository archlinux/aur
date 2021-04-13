# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=horizon
pkgbase=openstack-$_pyname
pkgname=(openstack-$_pyname{,-doc})
pkgver=19.2.0
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
	python-freezegun
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
md5sums=('7c5c9485de0f2e0797adb721185dce31'
         'b8ba491d7766353ff913a592328dca25'
         '59e7b05e721aa3c6609a9f86b9fb5b1e'
         'f07b434372688e975fa7f18e472372ad'
         '94282686c3903ff4a15e75c519186541'
         'ca5311dc0f58af1e2f5a306038128ce7'
         'c656448ba05ca49ffc6897d4e92e64d8')
sha256sums=('3f8f78a23876c3efcbe4cb91898b2594e4203c1535461532cba372f230faf3a5'
            '7f869497f2121a86956c456c2d4be8e77f68e97407b898c2ee6893092c0fc603'
            '43e9fa05b50503bd38b1e86b0bad4e481f096cef8ed32d2e32d9b6c047eb9d1f'
            'e1354ebbc4a319d476e87b2f411d4b51ab6bb114fa0efacbf75773687f4432ee'
            'be5b591bde6abef4b445170a2cef4325106e516c5adf15d3de6cd7f34753dc6f'
            'fab8d2aaf442c5e7760808a72a1e3209f3099377a7ae9fa7eb1d446effdcdee3'
            'bef6fe090baba05e6a72fb118ba709eb945133ae8094ad5aa932bbf76a9ffe23')
sha512sums=('22ed72f1a0bbe9c1b09cb131e77228090cc2fdfb46b3c35f1dfe5e991081dab4d1b3ee6579f597ba8438ef997b61d65c7a08d47eae573d3ef40e8a0dd8ffbce2'
            '74017d1d1c3c9b746afd7e412e9f17daa62e4fc29d870228e2ea23acf4468cb9b9ea2d44cdd8412adfb263675410ab6bd94c874b3def05ee73ed49dff2726b29'
            '47bdb791db13b6ec3863b3fb2f8e3f0bf7924cb0985ffac7f2b02ffa72908b0e24efc3ec77c10b8ae6cc423e73fadba0f502670faa3033dd0db9db9e2eebd5ae'
            'af03c4bcab3200249fa476ad0f2ae0e0e7c880ebfa5520d477e11252d1b7f33d07434868e49d4836efad6c06201c67c39dc8b837f94b9ca1b3cea714b98a0de1'
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
