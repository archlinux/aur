# Maintainer: Sir-Photch <sir-photch@posteo.me>

pkgname=litellm-ollama
pkgver=3
pkgrel=4
pkgdesc='Metapackage to setup ollama models with OpenAI API locally'
arch=(any)
license=(MIT)
depends=(
    'gunicorn'
    'litellm'
    'ollama'
    'python-apscheduler'
    'python-backoff'
    'python-fastapi'
    'python-orjson'
    'uvicorn'
)
backup=(
	etc/litellm-ollama/litellm-ollama.env
	etc/litellm-ollama/litellm-ollama.argconf
)
install=litellm-ollama.install
source=(
	'litellm-ollama@.service'
	'litellm-ollama.argconf'
	'litellm-ollama.install'
	'sysusers-litellm-ollama.conf'
	'tmpfiles-litellm-ollama.conf'
	'litellm-ollama.env'
)

sha512sums=('931519edb0c099d7f5e34efb6e440bc491aa76f031cbae8f6ffb02e2717c63dcca92fa2ee4a72686e40b9b9928647549ed897a6dc466a342e333d16fbb192489'
            '7f738d1b9e297db69d884248b1a3dfc7acb1efa92403f20427a67332b34a4381fe4c5ad128f8ee6c67a6a3c7615edbba64b4ed91028e6ed7a204f0e30c7dad0b'
            'b9493c66cb699af763eb828fe54ed974d8bdc3e1fb5fd5aabb2bc0040f317088f28661b7964d23f3495fee6afbcf093334cb24cfa20d831ebf3bacb72c6e58c3'
            'ff9f5761112a6bc9a588588fa13ce552dd0d0f1e36873014a3b6aa07938caf6e61b9052b5aa4ce3f54239d6a53f42e26fb3e980250a08db09063be70d68070cd'
            'd4c3034ea25e2776f4b9072f3f55b8b6dad4a8c31a748d4661fc1f1d87b77d416ea52b1bba4690a81c2c16034c87dacd13e49bc7323eba989b67d096fdc473e2'
            '0d4ab88f4faa0283812f3532e95337e4cb12155001c55043fa912d137156c59f9c2ddc5c86b5105398426817bee6d8a283957767d2968dc02663cd1ee8ea3762')

package() {
	cd "$srcdir"

	install -Dm640 "$pkgname.env" "$pkgdir/etc/$pkgname/$pkgname.env"
	install -Dm640 "$pkgname.argconf" "$pkgdir/etc/$pkgname/$pkgname.argconf"

	mkdir -p "$pkgdir/var/lib/$pkgname/.config/litellm"
	ln -s "/etc/$pkgname/$pkgname.env" "$pkgdir/var/lib/$pkgname/.config/litellm/.env.litellm"

	install -Dm644 "$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
	install -Dm644 "sysusers-$pkgname.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "tmpfiles-$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
